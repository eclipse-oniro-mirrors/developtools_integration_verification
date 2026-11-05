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
  const input: String = 'X'.repeat(9999);
  input.replace(
    new RegExp('^|X', 'g'),
    (match: String, args: (Object | undefined)[]): String => {
      const offset: int = (args[0] as Double).toInt();
      if (offset > 0) {
        arktest.assertEQ('X', match, 'at position 0x' + offset.toString(16));
      }
      return match;
    }
  );
}
