module com.example.m3 {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires org.kordamp.bootstrapfx.core;

    opens com.example.m3 to javafx.fxml;
    exports com.example.m3;
}