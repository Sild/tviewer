package com.sild.tviewer.converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.lang.invoke.MethodHandles;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class StringTrimConverter implements Converter<String, String> {
    private static final Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    public String convert(String source) {
        logger.debug("Trimming stream: {}", source);
        return source.trim();
    }

}
