/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: do_while_statement_executes_before_condition
// description: A do-while body executes before a false condition is checked

function main(): void {
    let reached: int = 0;
    do {
        reached = 1;
    } while (false);
    arktest.assertEQ(reached, 1);

    do {
        reached = 2;
    } while (0 == 1);
    arktest.assertEQ(reached, 2);

    do {
        reached = 3;
    } while (''.length != 0);
    arktest.assertEQ(reached, 3);
}
