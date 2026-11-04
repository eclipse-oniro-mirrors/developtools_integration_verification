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

// arktsid: array_from_mapfn_throws
// description: An exception thrown by the mapFn propagates out of Array.from

function main(): void {
    let array: int[] = [2, 4, 8, 16, 32, 64, 128];

    arktest.expectThrow((): void => {
        Array.from<int, int>(array, (_v: int, _k: int): int => {
            throw new Error('mapfn throws');
        });
    }, (e: Error): boolean => e instanceof Error);
}