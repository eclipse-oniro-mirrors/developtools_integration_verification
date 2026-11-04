/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

function returnAfterNonTerminatingComment(): int {
  return/* Counts as non-line-terminating whitespace */1;
}

function returnAfterTerminatingBlockComment(): int | undefined {
  return/* Counts as line-terminator whitespace.
          */2;
}

function returnAfterLineComment(): int | undefined {
  return// Comment doesn't include line-terminator at end.
      3;
}

function main(): void {
  arktest.assertEQ(1, returnAfterNonTerminatingComment());
  arktest.assertEQ(undefined, returnAfterTerminatingBlockComment());
  arktest.assertEQ(undefined, returnAfterLineComment());
}
