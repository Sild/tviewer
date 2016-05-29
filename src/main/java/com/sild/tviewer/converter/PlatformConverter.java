package com.sild.tviewer.converter;

import com.sild.tviewer.model.Platform;
import com.sild.tviewer.service.impl.PlatformServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.lang.invoke.MethodHandles;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class PlatformConverter implements Converter<String, Platform> {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    @Autowired
    private PlatformServiceImpl platformService;

    public Platform convert(String id) {
        Platform platform = platformService.get(Integer.parseInt(id));
        logger.debug("Convert id = {} => platform = {}", id, platform.toString());

        return platform;
    }
}
