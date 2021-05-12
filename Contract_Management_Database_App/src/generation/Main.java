package generation;

import com.github.javafaker.Faker;
import generation.enums.DepartmentType;
import generation.models.Name;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class Main {

    private static final String OUTPUT_FILE = "src/sql/insertCandidate.sql";

    public static void main(String[] args){
        System.out.println("Generating sql seed data script...");

        String vanDavid = "Van David";
        String david = "David";
        String joshFetcher = "Josh Fetcher";

        ArrayList<String> requiredManagers = new ArrayList<>(Arrays.asList(
                vanDavid,
                david
        ));

        ArrayList<String> requiredDevelopers = new ArrayList<>(Arrays.asList(
                joshFetcher
        ));

        HashMap<String, String> requiredManagerAssociations = new HashMap<>();
        requiredManagerAssociations.put(joshFetcher, david);

        ArrayList<String> requiredCompanies = new ArrayList<>(Arrays.asList(
                "CSC Corp."
        ));

        RandomDataGenerator dataGenerator = new RandomDataGenerator(new Faker());
        String sql =  new CmsDataBuilder(dataGenerator)
                .addEmployees(DepartmentType.values().length, 10, 60,
                        requiredManagers, requiredDevelopers, requiredManagerAssociations)
                .addContracts(12, 6, "2016-01-01 00:00", "2017-12-12 00:00", requiredCompanies)
                .addWorksOnRelationship(5, 8)
                .build();

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(OUTPUT_FILE ,false))){
            writer.write(sql);
        }catch (IOException e){
            e.printStackTrace();
        }

        System.out.println("Generation done");
    }

}
