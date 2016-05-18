package com.sild.tviewer.model;

/**
 * @author Dmitry Korchagin.
 */
public enum CurrencyType {
    RUR("RUR"),
    USD("USD"),
    EUR("EUR");
    private String value;

    private CurrencyType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
