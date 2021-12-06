package se.karleklund.hydrothermalventure;

import java.util.ArrayList;
import java.util.List;

public class Field {
    ArrayList<Line> lines;

    public Field(List<String> lineTexts) {
        lines = new ArrayList<>();
        lineTexts.forEach(lineText -> lines.add(new Line(lineText)));
    }

    public ArrayList<LinePoint> points() {
        ArrayList<LinePoint> result = new ArrayList<LinePoint>();
        lines.forEach(line -> result.addAll(line.points));
        return result;
    }
}
