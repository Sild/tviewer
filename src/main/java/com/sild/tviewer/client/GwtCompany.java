package com.sild.tviewer.client;

/**
 * @author Dmitry Korchagin.
 */

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.shared.GWT;
import com.google.gwt.event.dom.client.*;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.*;
import com.sild.tviewer.model.Company;
import com.sild.tviewer.service.CompanyService;
import com.sild.tviewer.service.CompanyServiceAsync;

import java.util.List;

public class GwtCompany implements EntryPoint {
    /**
     * The message displayed to the user when the server cannot be reached or
     * returns an error.
     */
    private static final String SERVER_ERROR = "An error occurred while "
            + "attempting to contact the server. Please check your network "
            + "connection and try again.";

    /**
     * Create a remote service proxy to talk to the server-side Greeting service.
     */
    private final CompanyServiceAsync companyService = GWT
            .create(CompanyService.class);

    /**
     * This is the entry point method.
     */
    public void onModuleLoad() {
        final Button addButton = new Button("Добавить");
        final TextBox nameField = new TextBox();
        final TextBox colorField = new TextBox();
        final TextBox commentField = new TextBox();
        final Label errorLabel = new Label();

        // We can add style names to widgets
//        sendButton.addStyleName("sendButton");

        // Add the nameField and sendButton to the RootPanel
        // Use RootPanel.get() to get the entire body element
        RootPanel.get("nameContainer").add(nameField);
        RootPanel.get("colorContainer").add(colorField);
        RootPanel.get("commentContainer").add(commentField);
        RootPanel.get("addContainer").add(addButton);

        // Focus the cursor on the name field when the app loads
        nameField.setFocus(true);
        nameField.selectAll();

        // Create the popup dialog box
        final DialogBox dialogBox = new DialogBox();
        dialogBox.setText("Remote Procedure Call");
        dialogBox.setAnimationEnabled(true);
        final Button closeButton = new Button("Close");
        // We can set the id of a widget by accessing its Element
        closeButton.getElement().setId("closeButton");
        final Label textToServerLabel = new Label();
        final HTML serverResponseLabel = new HTML();
        VerticalPanel dialogVPanel = new VerticalPanel();
        dialogVPanel.addStyleName("dialogVPanel");
        dialogVPanel.add(new HTML("<b>Sending name to the server:</b>"));
        dialogVPanel.add(textToServerLabel);
        dialogVPanel.add(new HTML("<br><b>Server replies:</b>"));
        dialogVPanel.add(serverResponseLabel);
        dialogVPanel.setHorizontalAlignment(VerticalPanel.ALIGN_RIGHT);
        dialogVPanel.add(closeButton);
        dialogBox.setWidget(dialogVPanel);

        // Add a handler to close the DialogBox
        closeButton.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                dialogBox.hide();
                addButton.setEnabled(true);
                addButton.setFocus(true);
            }
        });

        // Create a handler for the sendButton and nameField
        class AddHandler implements ClickHandler {
            /**
             * Fired when the user clicks on the sendButton.
             */
            public void onClick(ClickEvent event) {
                final Company company = new Company();
                company.setName(nameField.getText());
                company.setColor(colorField.getText());
                company.setComment(commentField.getText());

                companyService.createOrUpdate(company, new AsyncCallback<Void>() {
                    @Override
                    public void onFailure(Throwable throwable) {
                        dialogBox.setText("Ошибка");
                        serverResponseLabel.setHTML(SERVER_ERROR);
                        dialogBox.center();
                        closeButton.setFocus(true);
                    }

                    @Override
                    public void onSuccess(Void aVoid) {
                        dialogBox.setText("Успех");
                        serverResponseLabel.setHTML("Компания " + company.getName() + " добавлена");
                        dialogBox.center();
                        closeButton.setFocus(true);
                    }
                });
            }
        }
        // Add a handler to send the name to the server
        addButton.addClickHandler(new AddHandler());
    }
}