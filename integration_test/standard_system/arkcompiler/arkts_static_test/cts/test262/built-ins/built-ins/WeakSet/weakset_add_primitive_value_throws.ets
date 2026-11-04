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
// arktsid: weakset_add_primitive_value_throws
// description: WeakSet.add throws TypeError for primitive values that cannot be held weakly
// Conversion notes: null/undefined/symbol variants dropped — null/undefined are not assignable to the Object value type
// in ArkTS and Symbol is unsupported.

function main(): void {
    let s = new WeakSet<Object>();
    arktest.expectThrow((): void => { s.add(1); }, (e: Error): boolean => e.name === 'TypeError');
    arktest.expectThrow((): void => { s.add(true); }, (e: Error): boolean => e.name === 'TypeError');
    arktest.expectThrow((): void => { s.add('string'); }, (e: Error): boolean => e.name === 'TypeError');
    arktest.expectThrow((): void => { s.add(NaN); }, (e: Error): boolean => e.name === 'TypeError');
}