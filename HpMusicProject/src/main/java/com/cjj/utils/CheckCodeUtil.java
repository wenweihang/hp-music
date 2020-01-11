package com.cjj.utils;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class CheckCodeUtil {
    private static int h=60;
    private static int w=120;
    private static Random r=new Random();
    private static String font="0123456789abcdefghijklmnopqrsduvwxyzABCDEFGHIJKLMNOPQRSDUVWXYZ";
    private static String[] fontFormat={"楷体","方正舒体","华文隶书","Trajan Pro","Ink Free"};
    private static int[] fontStyle={Font.BOLD,Font.PLAIN,Font.ITALIC};
    private static BufferedImage bi;
    private static Graphics2D g;

    //获取字体样式
    private static String getFormat(){
        int index=r.nextInt(fontFormat.length);
        return fontFormat[index];
    }
    //获取字体颜色
    private static Color getColor(){
        int red=r.nextInt(200);
        int green=r.nextInt(200);
        int blue=r.nextInt(200);
        return new Color(red,green,blue);
    }
    //获取字体形态
    private static int getFontStyle(){
        int index=r.nextInt(fontStyle.length);
        return fontStyle[index];
    }
    //获取字体
    public static String getFont(){
        int x=10;
        int y=35;
        String vContent="";
        for(int i=0;i<4;i++){
            int index=r.nextInt(font.length());
            char f=font.charAt(index);
            g.setFont(new Font(getFormat(),getFontStyle(),r.nextInt(20)+36));
            g.setColor(getColor());
            String sf=f+"";
            g.drawString(sf,r.nextInt(6)+x , r.nextInt(20)+y);
            x=x+22;
            vContent=vContent+f;
        }
        return vContent;
    }

    public static void getImage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        bi=new BufferedImage(w,h,BufferedImage.TYPE_INT_BGR);
        g= (Graphics2D) bi.getGraphics();
        g.setColor(Color.ORANGE);
        g.fillRect(0,0 ,w ,h );
        for(int i=0;i<6;i++){
            g.setColor(Color.black);
            g.drawLine(r.nextInt(70)+10,r.nextInt(40)+12,
                    r.nextInt(70)+40 ,r.nextInt(40)+12 );
        }
        String vContent=getFont();
        req.getSession().setAttribute("vContent",vContent );
        ImageIO.write(bi, "JPEG",resp.getOutputStream());
        resp.getOutputStream().flush();
    }
}
