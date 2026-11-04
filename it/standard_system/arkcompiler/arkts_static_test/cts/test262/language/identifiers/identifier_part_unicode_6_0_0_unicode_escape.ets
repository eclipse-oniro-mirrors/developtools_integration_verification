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

// arktsid: identifier_part_unicode_6_0_0_unicode_escape
// description: Unicode 6.0.0 ID_Continue characters are valid via escapes

function main(): void {
    let _\u065F\u0859\u085A\u085B\u093A\u093B\u094F\u0956\u0957\u0F8D\u0F8E\u0F8F\u135D: int = 1;
    let _\u135E\u1BE6\u1BE7: int = 1;
    let _\u1BE8\u1BE9\u1BEA\u1BEB\u1BEC\u1BED\u1BEE\u1BEF\u1BF0\u1BF1\u1BF2\u1BF3\u1DFC: int = 1;
    let _\u2D7F\u{11000}: int = 1;
    let _\u{11001}\u{11002}\u{11038}\u{11039}\u{1103A}\u{1103B}\u{1103C}\u{1103D}: int = 1;
    let _\u{1103E}\u{1103F}: int = 1;
    let _\u{11040}\u{11041}\u{11042}\u{11043}\u{11044}\u{11045}\u{11046}\u{11066}: int = 1;
    let _\u{11067}\u{11068}: int = 1;
    let _\u{11069}\u{1106A}\u{1106B}\u{1106C}\u{1106D}\u{1106E}\u{1106F}: int = 1;
}
