/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * Java equivalent of EXP2_17_08_015_RUNTIME_SWITCH_FLOW
 * Tests: switch int/string, default, if-else, return
 *
 * @since 2025
 */
public class JavaSwitchFlow {
    public static void main(String[] args) {
        // Test switch with integer
        String result = "";
        int day = 3;
        switch (day) {
            case 1: result = "Monday"; break;
            case 2: result = "Tuesday"; break;
            case 3: result = "Wednesday"; break;
            default: result = "other"; break;
        }
        assert result.equals("Wednesday") : "switch int assertion failed: " + result;

        // Test switch with string
        int colorCode = 0;
        String color = "green";
        switch (color) {
            case "red": colorCode = 1; break;
            case "green": colorCode = 2; break;
            case "blue": colorCode = 3; break;
            default: colorCode = 0; break;
        }
        assert colorCode == 2 : "switch string assertion failed: " + colorCode;

        // Test switch default fallback
        String defResult = "";
        int unknownVal = 99;
        switch (unknownVal) {
            case 1: defResult = "one"; break;
            case 2: defResult = "two"; break;
            default: defResult = "default"; break;
        }
        assert defResult.equals("default") : "switch default assertion failed: " + defResult;

        // Test if-else flow
        int x = 15;
        String ifResult = "";
        if (x > 20) {
            ifResult = "large";
        } else if (x > 10) {
            ifResult = "medium";
        } else {
            ifResult = "small";
        }
        assert ifResult.equals("medium") : "if-else assertion failed: " + ifResult;

        // Test return value
        int returned = testReturn();
        assert returned == 42 : "return assertion failed: " + returned;

        System.out.println("verified");
    }

    static int testReturn() {
        int a = 40;
        int b = 2;
        return a + b;
    }
}
