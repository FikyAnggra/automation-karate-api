package api.proearn;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

public class TestRunnerProearn {
    @Karate.Test
    Karate Regression() {
        return Karate.run().relativeTo(getClass());
}
