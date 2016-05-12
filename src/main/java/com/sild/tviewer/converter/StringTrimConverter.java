package com.sild.tviewer.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 * @author Dmitry Korchagin.
 */
@Component
public class StringTrimConverter implements Converter<String, String> {

    public String convert(String source) {
        return source.trim();
    }

}
