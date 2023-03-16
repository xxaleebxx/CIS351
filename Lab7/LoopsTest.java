import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class LoopsTest {


    /******************************************************************
     *
     * Test indexOf
     *
     ******************************************************************/

    Label array1 = wordData(5, 4, 7, 6, 9, 8, 2, 1, -1);

    @Test
    public void indexOf_findsValueOccurringOnceOnly() {
	run("indexOf", 2, array1);
	Assert.assertEquals(6, get(v0));
    }

    @Test
    public void indexOf_returns_neg1_ifNotFound() {
	run("indexOf", 3, array1);
	Assert.assertEquals(-1, get(v0));
    }
	
    // Write more tests.  Your tests shouldn't all use array1.

    /******************************************************************
     *
     * Test max
     *
     ******************************************************************/

    Label sum67_array1 = wordData(14, 6, 2, 3, 4, 7, 9, 10);

    Label sum67_array2 = wordData(6, 2, 3, 4, 7, 9, 10);

    Label empty_array = wordData();

    Label same_array0 = wordData(0, 0, 0, 0, 0, 0);

    Label same_array10 = wordData(10, 10, 10, 10, 10, 10);

    @Test
    public void max_findsMaximum() {
	run("max", array1, 9);
	Assert.assertEquals(9, get(v0));
    }

    @Test
    public void max_findsMaximum2() {
	run("max", sum67_array1, 8);
	Assert.assertEquals(14, get(v0));
    }

    @Test
    public void max_findsMaximum3() {
	run("max", sum67_array2, 7);
	Assert.assertEquals(10, get(v0));
    }

    @Test
    public void max_findsMaximum0() {
	run("max", empty_array, 0);
	Assert.assertEquals(0, get(v0));
    }

    @Test
    public void max_findsMaxSame0() {
	run("max", same_array0, 6);
	Assert.assertEquals(0, get(v0));
    }

    @Test
    public void max_findsMaxSame10() {
	run("max", same_array10, 6);
	Assert.assertEquals(10, get(v0));
    }

    // // Write **a lot** more tests.


    /******************************************************************
     *
     * Test sum13
     *
     ******************************************************************/

    Label sum13_array1 = wordData(1, 2, 2, 1);
    Label sum13_array2 = wordData(1, 2, 13, 2, 1, 13);

    @Test
    public void sum13_sumsAllIfNo13() {
	run("sum13", sum13_array1, 4);
	Assert.assertEquals(6, get(v0));
    }

    @Test
    public void sum13_ignore13_andFollowing() {
	run("sum13", sum13_array2, 6);
	Assert.assertEquals(4, get(v0));
    }

    // Write **a lot** more tests.

    /******************************************************************
     *
     * Test sum67
     *
     ******************************************************************/

    //Label sum67_array1 = wordData(14, 6, 2, 3, 4, 7, 9, 10);

    @Test
    public void sum67_handlesOneRun() {
	run("sum67", sum67_array1, 8);
	Assert.assertEquals(33, get(v0));
    }
    // Write **a lot** more tests

}
