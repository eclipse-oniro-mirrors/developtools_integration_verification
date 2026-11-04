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

// arktsid: mapfn_abrupt_completion
// description: TypedArray.from propagates an abrupt throw from mapfn
// Conversion notes: source is an ArrayLike<number> with length 2 and value 42 at index 0; mapfn throws at k=0 so the
// hole at index 1 is never touched.

class Source implements ArrayLike<number> {
    get length(): int {
        return 2;
    }
    $_get(index: int): number {
        return 42; // index 1 (the 'hole') is never reached: mapfn throws at k=0
    }
}

function main(): void {
    let src: Source = new Source();
    arktest.expectThrow(
        () => {
            Int32Array.from(src, (v: number, k: number): number => {
                throw new Error('mapfn abrupt');
            });
        },
        (e: Error): boolean | string => {
            if (e.name === 'Error') {
                return true;
            }
            return 'Expected Error but got ' + e.name;
        }
    );
}