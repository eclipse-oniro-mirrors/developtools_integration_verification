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
 * Java cross-verification: final method runtime behavior
 * Equivalent to ArkTS runtime tests 011-014
 */
class Accumulator {
    private int total;
    private StringBuilder history;

    public Accumulator() {
        this.total = 0;
        this.history = new StringBuilder();
    }

    /**
     * Add number to total
     *
     * @param n number to add
     */
    public final void add(int n) {
        total += n;
    }

    /**
     * Record an operation
     *
     * @param op operation to record
     */
    public final void record(String op) {
        history.append(op);
    }

    public final int getTotal() {
        return total;
    }

    public final String getHistory() {
        return history.toString();
    }
}

/** Java cross-verification: final method runtime behavior */
public class FinalMethodRuntime {
    public static void main(String[] args) {
        Accumulator acc = new Accumulator();
        assert acc.getTotal() == 0 : "total should be 0";
        assert acc.getHistory().equals("") : "history should be empty";

        acc.add(10);
        acc.record("+10");
        assert acc.getTotal() == 10 : "total should be 10";

        acc.add(25);
        acc.record("+25");
        assert acc.getTotal() == 35 : "total should be 35";
        assert acc.getHistory().equals("+10+25") : "history should be '+10+25'";

        System.out.println("verified");
    }
}
