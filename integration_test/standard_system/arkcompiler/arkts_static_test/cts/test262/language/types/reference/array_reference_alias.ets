/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: array_reference_alias
// description: Reference to self-modifying object remains the integrity
// Conversion notes: var itemsRef = items 数组引用别名；push/下标写/读 length/下标读全部经别名可见，ArkTS 数组为引用类型（先例 [[for-of-top-closure]]）

function main(): void {
    let items: string[] = ['one', 'two', 'three'];
    let itemsRef: string[] = items;
    items.push('four');
    arktest.assertEQ(itemsRef.length, 4);

    let items2: string[] = ['one', 'two', 'three'];
    let itemsRef2: string[] = items2;
    items2[1] = 'duo';
    arktest.assertEQ(itemsRef2[1], 'duo');
}
