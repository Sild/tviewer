package com.sild.tviewer.converter;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.service.impl.PlatformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class PlatformConverter implements Converter<String, Platform> {

    @Autowired
    private PlatformServiceImpl platformService;

    public Platform convert(String id) {
        return platformService.get(Integer.parseInt(id));
//        return platformService.get(Integer.parseInt((String)id));
    }
}
