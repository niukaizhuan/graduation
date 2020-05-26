package com.example.demo.util;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;

public class FfmpegUtil {
    /**
     * 截取缩略图的方法
     * 获取指定视频的帧并保存为图片至指定目录
     *
     * @param videofile 视频路径
     * @param framefile 缩略图保径存路
     * @throws Exception
     */
    public static void fetchFrame(String videofile, String framefile)
            throws Exception {
        long start = System.currentTimeMillis();
        File targetFile = new File(framefile);
        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(videofile);
        ff.start();
        int length = ff.getLengthInFrames();
        int i = 0;
        Frame f = null;
        while (i < length) {
            // 去掉前5帧，避免出现全黑的图片，依自己情况而定
            f = ff.grabImage();
            if ((i > 5) && (f.image != null)) {
                break;
            }
            i++;
        }
        ImageIO.write(FrameToBufferedImage(f), "jpg", targetFile);
        ff.stop();
        System.out.println(System.currentTimeMillis() - start);
    }

    public static BufferedImage FrameToBufferedImage(Frame frame) {
        //创建BufferedImage对象
        Java2DFrameConverter converter = new Java2DFrameConverter();
        BufferedImage bufferedImage = converter.getBufferedImage(frame);
        return bufferedImage;
    }

    public static void main(String[] args) throws Exception {
        String ffmpegPath = "D:\\jit\\file\\upload\\video\\20200411215250_27_尚学堂_高淇_JAVA基础300集最全教程_键盘输入_Scanner类的使用_import简单入门.wmv";
        String upFilePath = "D:\\jit\\file\\upload\\video\\img2.jpg";
        fetchFrame(ffmpegPath, upFilePath);
    }
}
