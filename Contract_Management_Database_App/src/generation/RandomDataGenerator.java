package generation;

import com.github.javafaker.Faker;
import generation.models.Name;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class RandomDataGenerator {

        private int addressCounter = 0;

        private static final ArrayList<String> addresses = new ArrayList<>(Arrays.asList(
                "62 Kent St E Lindsay ON K9V 2C5",
                "4520 7th Ave W Vancouver BC V6R 1X3",
                "249 4th Av SE , Altona, MB, R0G",
                "322 7 St , Beiseker, AB, T0M 0G0",
                "4915 52 St , Bruderheim, AB, T0B 0S0",
                "54 Rue Du Calvados , Candiac, QC, J5R 6H4",
                "426 4 St , Canmore, AB, T1W 2H1",
                "2250 SE Marine Dr 208 Vancouver BC V5P 2S2",
                "48 Rue De Cherbourg , Candiac, QC, J5R 6S1",
                "3258 Lansdown Dr Burlington ON L7M 1K3",
                "234 Ch Durnford St Faust Lac Carré QC J0T 1J2",
                "9570 157 St Surrey BC V4N 2L1",
                "3940 Bd Dagenais O 151 Laval QC H7R 5X9",
                "100 Boul Taschereau , La Prairie, QC, J5R 1S8",
                "21352 Smith Cres Langley BC V2Y 2R4",
                "14 Tsse Fonrouge , Chambly, QC, J3L 4P1",
                "2013 Manston Rd , Black Creek, BC, V9J 1A6",
                "5411 Lakeshore Rd 14 Burlington ON L7L 1E1"
        ));

        private Faker faker;
        private Random random;

        public RandomDataGenerator(Faker faker) {
            this.faker = faker;
            this.random = new Random();
        }

        public String getName() {
            return new Name(getFirstName(), getLastName()).getFullName();
        }

        public String getFirstName() {
            return faker.name().firstName().replace("'", "''");
        }

        public String getLastName() {
            return faker.name().lastName().replace("'", "''");
        }

        public String getCompanyName() {
            return faker.company().name().replaceAll("'", "''");
        }

        public int getBetween(int minValue, int maxValue){
            return Math.max(random.nextInt(maxValue + 1), minValue);
        }

        public Faker getFaker() {
            return faker;
        }

        public String getAddress(){
            return addresses.get(addressCounter++%addresses.size());
        }
}
