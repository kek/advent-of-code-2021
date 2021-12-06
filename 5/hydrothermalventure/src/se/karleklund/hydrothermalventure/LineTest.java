package se.karleklund.hydrothermalventure;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class LineTest {
    @Test
    void test_draw_straight_lines() {
        assertEquals("[(0,9), (5,9), (1,9), (2,9), (3,9), (4,9)]", new Line("0,9 -> 5,9").points.toString());
        assertEquals("[(9,4), (3,4), (8,4), (7,4), (6,4), (5,4), (4,4)]", new Line("9,4 -> 3,4").points.toString());
        assertEquals("[(2,2), (2,1)]", new Line("2,2 -> 2,1").points.toString());
        assertEquals("[(7,0), (7,4), (7,1), (7,2), (7,3)]", new Line("7,0 -> 7,4").points.toString());
        assertEquals("[(0,9), (2,9), (1,9)]", new Line("0,9 -> 2,9").points.toString());
        assertEquals("[(3,4), (1,4), (2,4)]", new Line("3,4 -> 1,4").points.toString());
    }

    @Test
    void test_draw_diagonal_lines() {
        assertEquals("[(0,0), (1,1)]", new Line("0,0 -> 1,1").points.toString());
        assertEquals("[(1,1), (0,0)]", new Line("1,1 -> 0,0").points.toString());
        assertEquals("[(0,0), (1,1), (2,2)]", new Line("0,0 -> 2,2").points.toString());

        assertEquals("[(8,0), (7,1), (6,2), (5,3), (4,4), (3,5), (2,6), (1,7), (0,8)]", new Line("8,0 -> 0,8").points.toString());
        assertEquals("[(6,4), (5,3), (4,2), (3,1), (2,0)]", new Line("6,4 -> 2,0").points.toString());
        assertEquals("[(0,0), (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8)]", new Line("0,0 -> 8,8").points.toString());
        assertEquals("[(5,5), (4,4), (3,3), (2,2)]", new Line("5,5 -> 8,2").points.toString());
    }
}

