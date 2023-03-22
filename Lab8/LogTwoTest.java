import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;

import java.beans.Transient;

import static edu.gvsu.mipsunit.munit.MUnit.*;

public class LogTwoTest {

    @Before
    public void before() {
    set(v0, 1337);
    }

    /******************************************************************
     *
     * Test log_two
     *
     *****************************************************************/

    @Test 
    public void log_two_one() {
        run("log_two", 1);
        Assert.assertEquals(0, get(v0));
    }

    @Test 
    public void log_two_zero() {
        run("log_two", 0);
        Assert.assertEquals(-1, get(v0));
    }

    @Test
    public void log_two_10() {
        run("log_two", 10);
        Assert.assertEquals(3, get(v0));
    }

    @Test
    public void log_two_32() {
        run("log_two", 32);
        Assert.assertEquals(5, get(v0));
    }

    @Test
    public void log_two_100() {
        run("log_two", 100);
        Assert.assertEquals(6, get(v0));
    }

    @Test
    public void log_two_1024() {
        run("log_two", 1024);
        Assert.assertEquals(10, get(v0));
    }
    /******************************************************************
     *
     * Write many more tests!  * Test Edge Cases *
     *
     *****************************************************************/
    
} // end class


