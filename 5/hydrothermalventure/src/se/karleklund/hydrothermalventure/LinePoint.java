package se.karleklund.hydrothermalventure;

import java.util.Objects;

public class LinePoint {
    public LinePoint(String linePointText) {
        String[] split = linePointText.split(",");
        x = Integer.decode(split[0]);
        y = Integer.decode(split[1]);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LinePoint linePoint = (LinePoint) o;
        return x == linePoint.x && y == linePoint.y;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }

    @Override
    public String toString() {
        return "(" + x + "," + y + ")";
    }

    int x, y;
}
