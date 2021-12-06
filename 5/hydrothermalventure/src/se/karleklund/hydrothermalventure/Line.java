package se.karleklund.hydrothermalventure;

import java.util.ArrayList;

public class Line {
    LinePoint start, end;
    public ArrayList<LinePoint> points;

    public Line(String lineText) {
        String[] split = lineText.split(" -> ");
        start = new LinePoint(split[0]);
        end = new LinePoint(split[1]);
        points = new ArrayList<>();


        //System.out.println("straight: " + lineText);
        if (isHorizontal()) {
            points.add(start);
            points.add(end);

            //System.out.println("horizontal");
            int beginX;
            int finishX;

            if (start.x < end.x) {
                beginX = start.x + 1;
                finishX = end.x;

                for (int i = beginX; i < finishX; ++i) {
                    LinePoint lp = new LinePoint(i + "," + start.y);
                    //System.out.println("adding " + lp);
                    points.add(lp);
                }
            } else {
                beginX = start.x - 1;
                finishX = end.x;

                for (int i = beginX; i > finishX; --i) {
                    LinePoint lp = new LinePoint(i + "," + start.y);
                    //System.out.println("adding " + lp);
                    points.add(lp);
                }
            }

        } else if (isVertical()) {
            points.add(start);
            points.add(end);

            //System.out.println("vertical");
            int beginY, finishY;
            if (start.y < end.y) {
                beginY = start.y + 1;
                finishY = end.y;

                for (int i = beginY; i < finishY; ++i) {
                    LinePoint lp = new LinePoint(start.x + "," + i);
//                        System.out.println("adding " + lp);
                    points.add(lp);
                }
            } else {
                beginY = start.y - 1;
                finishY = end.y;

                for (int i = beginY; i > finishY; --i) {
                    LinePoint lp = new LinePoint(start.x + "," + i);
                    //System.out.println("adding " + lp);
                    points.add(lp);
                }
            }

        } else if (true) {
            // diagonal
            int x = start.x, y = start.y;
            while (x != end.x && y != end.y) {
                points.add(new LinePoint(x + "," + y));
                if (start.x < end.x) ++x; else --x;
                if (start.y < end.y) ++y; else --y;
            }
            points.add(new LinePoint(x + "," + y));
        }
    }

    private boolean isStraight() {
        return isHorizontal() || isVertical();
    }

    private boolean isVertical() {
        return start.x == end.x;
    }

    private boolean isHorizontal() {
        return start.y == end.y;
    }

}
