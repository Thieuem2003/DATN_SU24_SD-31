package com.backend.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@Service
public class ImageUploadService {
    private final Cloudinary cloudinary;

    @Autowired
    public ImageUploadService() {
        cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dc6cz73nb",
                "api_key", "678734595755569",
                "api_secret", "sHh6iXzU-PmlxZcKqzVrNnJAOLg"
        ));
    }

    public String uploadImage(MultipartFile file) throws IOException {
        Map<?, ?> result = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.emptyMap());
        return result.get("url").toString();
    }

    public String uploadImageByName(String imageName) throws IOException {
        String imagePath = "D:\\datn-final\\" + imageName;

        File imageFile = new File(imagePath);
        if (!imageFile.exists()) {
            throw new IllegalArgumentException("Image not found with name: " + imageName);
        }

        Map<?, ?> result = cloudinary.uploader().upload(imageFile, ObjectUtils.emptyMap());

        return result.get("url").toString();
    }
}
