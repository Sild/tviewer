package com.sild.tviewer.model;

/**
 * @author Dmitry Korchagin.
 */
public enum TenderState {
    OPEN("open"),
    CANCEL("cancel"),
    CLOSE("close");

    private TenderState(String value) {
        this.value = value;
    }

    private final String value;

    public String getValue() {
        return this.value;
    }
}
