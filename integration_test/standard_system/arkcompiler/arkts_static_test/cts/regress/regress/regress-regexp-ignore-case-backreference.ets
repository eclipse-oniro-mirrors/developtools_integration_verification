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

function main(): void {
  const input: string = '(\'\')x\nx\uF670';
  const result: RegExpMatchArray | null = input.match(new RegExp('\\((\').*\\1\\)', 'i'));
  arktest.assertNE(result, null);

  const match: RegExpMatchArray = result!;
  arktest.assertEQ(match.length, 2);
  arktest.assertEQ(match[0], '(\'\')');
  arktest.assertEQ(match[1], '\'');
}
