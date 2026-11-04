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
  const globalRegexp: RegExp = new RegExp('x', 'g');

  arktest.assertEQ(0, globalRegexp.lastIndex, 'Global, initial lastIndex');

  arktest.assertTrue(globalRegexp.test('x'), 'Global, test 1');
  arktest.assertEQ(1, globalRegexp.lastIndex, 'Global, lastIndex after test 1');
  arktest.assertFalse(globalRegexp.test('x'), 'Global, test 2');
  arktest.assertEQ(0, globalRegexp.lastIndex, 'Global, lastIndex after test 2');

  const globalExecMatch: RegExpExecArray | null = globalRegexp.exec('x');
  arktest.assertNE(null, globalExecMatch, 'Global, exec 1');
  const globalMatch: RegExpExecArray = globalExecMatch!;
  arktest.assertEQ(1, globalMatch.length, 'Global, exec 1');
  arktest.assertEQ('x', globalMatch[0], 'Global, exec 1');
  arktest.assertEQ(1, globalRegexp.lastIndex, 'Global, lastIndex after exec 1');
  arktest.assertEQ(null, globalRegexp.exec('x'), 'Global, exec 2');
  arktest.assertEQ(0, globalRegexp.lastIndex, 'Global, lastIndex after exec 2');

  const nonGlobalRegexp: RegExp = new RegExp('x');

  arktest.assertEQ(0, nonGlobalRegexp.lastIndex, 'Non-global, initial lastIndex');

  arktest.assertTrue(nonGlobalRegexp.test('x'), 'Non-global, test 1');
  arktest.assertEQ(0, nonGlobalRegexp.lastIndex, 'Non-global, lastIndex after test 1');
  arktest.assertTrue(nonGlobalRegexp.test('x'), 'Non-global, test 2');
  arktest.assertEQ(0, nonGlobalRegexp.lastIndex, 'Non-global, lastIndex after test 2');

  const firstNonGlobalExecMatch: RegExpExecArray | null = nonGlobalRegexp.exec('x');
  arktest.assertNE(null, firstNonGlobalExecMatch, 'Non-global, exec 1');
  const firstNonGlobalMatch: RegExpExecArray = firstNonGlobalExecMatch!;
  arktest.assertEQ(1, firstNonGlobalMatch.length, 'Non-global, exec 1');
  arktest.assertEQ('x', firstNonGlobalMatch[0], 'Non-global, exec 1');
  arktest.assertEQ(0, nonGlobalRegexp.lastIndex, 'Non-global, lastIndex after exec 1');

  const secondNonGlobalExecMatch: RegExpExecArray | null = nonGlobalRegexp.exec('x');
  arktest.assertNE(null, secondNonGlobalExecMatch, 'Non-global, exec 2');
  const secondNonGlobalMatch: RegExpExecArray = secondNonGlobalExecMatch!;
  arktest.assertEQ(1, secondNonGlobalMatch.length, 'Non-global, exec 2');
  arktest.assertEQ('x', secondNonGlobalMatch[0], 'Non-global, exec 2');
  arktest.assertEQ(0, nonGlobalRegexp.lastIndex, 'Non-global, lastIndex after exec 2');
}
