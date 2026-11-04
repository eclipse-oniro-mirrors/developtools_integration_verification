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
  const re: RegExp = new RegExp('^.*?Y((?=X?).)*Y$', 's');
  const sult: string = 'YABCY';
  const result: RegExpExecArray | null = re.exec(sult);

  arktest.assertNE(null, result);

  const match: RegExpExecArray = result!;
  arktest.assertEQ(2, match.length);
  arktest.assertEQ(sult, match[0]);
  arktest.assertEQ('C', match[1]);
}
