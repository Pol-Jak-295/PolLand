#!/usr/bin/env python3
import sys, json, subprocess, os
from PyQt6.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QCheckBox, QComboBox,
    QPushButton, QVBoxLayout, QHBoxLayout, QMessageBox
)
from PyQt6.QtGui import QIcon

SETTINGS_FILE = os.path.expanduser("~/.config/ani-wrapper/settings.json")

# Load or initialize settings
if os.path.exists(SETTINGS_FILE):
    with open(SETTINGS_FILE) as f:
        settings = json.load(f)
else:
    settings = {"dub": False, "quality": "1080p", "mode": "download"}

class AniWrapper(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Ani-CLI Wrapper")
        self.setWindowIcon(QIcon())  # optionally add an icon here
        self.init_ui()
    
    def init_ui(self):
        layout = QVBoxLayout()

        # Search bar
        self.search_input = QLineEdit()
        self.search_input.setPlaceholderText("Enter anime title...")
        layout.addWidget(self.search_input)

        # Dub checkbox
        self.dub_checkbox = QCheckBox("Dub")
        self.dub_checkbox.setChecked(settings["dub"])
        layout.addWidget(self.dub_checkbox)

        # Mode dropdown
        self.mode_combo = QComboBox()
        self.mode_combo.addItems(["download", "stream"])
        self.mode_combo.setCurrentText(settings["mode"])
        layout.addWidget(self.mode_combo)

        # Quality dropdown
        self.quality_combo = QComboBox()
        self.quality_combo.addItems(["360p","720p","1080p"])
        self.quality_combo.setCurrentText(settings["quality"])
        layout.addWidget(self.quality_combo)

        # Buttons
        btn_layout = QHBoxLayout()
        execute_btn = QPushButton("Search / Execute")
        execute_btn.clicked.connect(self.execute)
        btn_layout.addWidget(execute_btn)
        layout.addLayout(btn_layout)

        self.setLayout(layout)

    def execute(self):
        query = self.search_input.text().strip()
        if not query:
            QMessageBox.warning(self, "Error", "Please enter an anime title.")
            return
        
        # Save settings
        settings["dub"] = self.dub_checkbox.isChecked()
        settings["mode"] = self.mode_combo.currentText()
        settings["quality"] = self.quality_combo.currentText()
        os.makedirs(os.path.dirname(SETTINGS_FILE), exist_ok=True)
        with open(SETTINGS_FILE, "w") as f:
            json.dump(settings, f, indent=4)

        # Build ani-cli command
        cmd = ["ani-cli", query]
        if settings["dub"]:
            cmd.append("--dub")
        cmd += ["--" + settings["mode"], "--quality", settings["quality"]]
        subprocess.run(cmd)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    wrapper = AniWrapper()
    wrapper.show()
    sys.exit(app.exec())

