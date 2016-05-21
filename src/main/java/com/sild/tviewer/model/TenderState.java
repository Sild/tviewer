package com.sild.tviewer.model;

/**
 * @author Dmitry Korchagin.
 */
public enum TenderState {
    OPEN("открыт"),
    CANCEL("отменен"),
    CLOSE("закрыт");
    private String value;

    private TenderState(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
