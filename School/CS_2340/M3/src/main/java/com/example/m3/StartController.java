package com.example.m3;

import javafx.scene.Scene;
import javafx.scene.control.Button;
//import view.WelcomeScreen;

public class StartController implements IController {
    private int width;
    private int height;
    public StartController(int width, int height) {
        this.width = width;
        this.height = height;
    }
    @Override
    public Scene initScreen() {
        WelcomeScreen screen = new WelcomeScreen(width, height);
        Button startButton = screen.getStartButton();
        startButton.setOnAction(e -> {
            AppLauncher.goToInitConfigScreen();
        });
        Button quitButton = screen.getQuitButton();
        quitButton.setOnAction(e -> {
            AppLauncher.getMainWindow().close();
        });
        return screen.getScene();
    }
}