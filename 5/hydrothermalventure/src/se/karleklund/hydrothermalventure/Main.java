package se.karleklund.hydrothermalventure;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {
    public static void main(String[] args) throws FileNotFoundException {
        System.out.println("At how many points do at least two lines overlap?");
        File file = new File("../input");
        Scanner sc = new Scanner(file);
        List<String> inputLines = new ArrayList<>();

        while (sc.hasNextLine())
            inputLines.add(sc.nextLine());

        //inputLines.forEach(System.out::println);

        /* Calculate result */

        Field field = new Field(inputLines);
        ArrayList<LinePoint> points = field.points();
        //points.forEach(p -> System.out.println(p.toString()));

        Hashtable<LinePoint, Integer> frequencies = new Hashtable<>();
        points.forEach(point ->
                {
                    Integer freq = frequencies.get(point);
                    if (freq == null) freq = 0;
                    freq = freq + 1;
                    frequencies.put(point, freq);
                }
        );
        //frequencies.forEach((point, freq) -> System.out.println(point + " :: " + freq));

        AtomicInteger overlaps = new AtomicInteger();
        frequencies.forEach((point, freq) -> {
                    if (freq > 1)
                        overlaps.getAndIncrement();
                }
        );
        System.out.println(overlaps);
    }
}
