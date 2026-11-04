/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: nan_left_operand_is_false
// description: Less-than-or-equal is false when the left operand is NaN

function main(): void {
    let nan: double = Number.NaN;
    arktest.assertFalse(nan <= 0);
    arktest.assertFalse(nan <= 1.1);
    arktest.assertFalse(nan <= -1.1);
    arktest.assertFalse(nan <= nan);
    arktest.assertFalse(nan <= Number.POSITIVE_INFINITY);
    arktest.assertFalse(nan <= Number.NEGATIVE_INFINITY);
    arktest.assertFalse(nan <= Number.MAX_VALUE);
    arktest.assertFalse(nan <= Number.MIN_VALUE);
}
