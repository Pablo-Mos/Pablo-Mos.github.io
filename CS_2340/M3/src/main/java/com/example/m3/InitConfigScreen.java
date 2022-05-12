package com.example.m3;

import javafx.collections.FXCollections;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.util.StringConverter;
//import model.GameDifficultyLevel;

public class InitConfigScreen {
    private final int width;
    private final int height;
    private final Button nextButton;
    private final Label titleLabel;
    private final Label nameLabel;
    private final Label difficultyLabel;
    private final TextField nameText;
    private final ChoiceBox<GameDifficultyLevel> difficultyChoiceBox;

    public InitConfigScreen(int width, int height) {
        this.width = width;
        this.height = height;
        nextButton = new Button("Next");
        titleLabel = new Label("Configurations");
        titleLabel.setFont(Font.font("Verdana", 60));
        titleLabel.setStyle("-fx-text-fill: WHITE");
        nameLabel = new Label("Username: ");
        nameLabel.setStyle("-fx-text-fill: WHITE");
        difficultyLabel = new Label("Difficulty: ");
        difficultyLabel.setStyle("-fx-text-fill: WHITE");
        nameText = new TextField();
        difficultyChoiceBox = initChoiceBox();
    }

    private ChoiceBox initChoiceBox() {
        ChoiceBox<GameDifficultyLevel> box = new ChoiceBox<>(FXCollections.observableArrayList(
                GameDifficultyLevel.EASY,
                GameDifficultyLevel.MEDIUM,
                GameDifficultyLevel.HARD)
        );
        box.setConverter(new StringConverter<GameDifficultyLevel>() {
            @Override
            public String toString(GameDifficultyLevel level) {
                switch (level) {
                    case EASY:
                        return "Easy";
                    case MEDIUM:
                        return "Medium";
                    default:
                        return "Hard";
                }
            }

            @Override
            public GameDifficultyLevel fromString(String string) {
                return null;
            }

        });
        box.setValue(GameDifficultyLevel.EASY);
        return box;
    }

    public Scene getScene() {
        HBox nameHBox = new HBox(20, nameLabel, nameText);
        nameHBox.setAlignment(Pos.CENTER);
        HBox difficultyHBox = new HBox(20, difficultyLabel, difficultyChoiceBox);
        difficultyHBox.setAlignment(Pos.CENTER);
        VBox root = new VBox(60,titleLabel, nameHBox, difficultyHBox, nextButton);
        root.setAlignment(Pos.CENTER);
        root.setStyle("-fx-background-color: linear-gradient(#99FFBE, #0B9C40)");
        Scene scene = new Scene(root, width, height);

        return scene;
    }

    public Button getNextButton() {
        return nextButton;
    }

    public TextField getUsername() {
        return nameText;
    }

    public ChoiceBox<GameDifficultyLevel> getDifficultyChoiceBox() {
        return difficultyChoiceBox;
    }

}