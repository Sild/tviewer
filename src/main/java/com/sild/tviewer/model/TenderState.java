package com.sild.tviewer.model;

/**
 * @author Dmitry Korchagin.
 */
public enum TenderState {
    OPEN("open"),
    CANCEL("cancel"),
    CLOSE("close");
    private final String value;

    private TenderState(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
