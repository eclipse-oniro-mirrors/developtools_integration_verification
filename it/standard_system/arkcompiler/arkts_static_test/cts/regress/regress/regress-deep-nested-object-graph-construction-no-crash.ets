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

interface T1Node {
  f1: int;
}

interface T2Node {
  f2: int;
}

interface Z1Node {
  x: T2Node;
  y: int;
}

interface YNode {
  x: Object;
  z1: Z1Node;
}

interface XNode {
  x: T1Node;
  y: YNode;
}

interface RootNode {
  x: XNode;
  z2: int;
}

let t1: T1Node = { f1: 0 };
let t2: T2Node = { f2: 0 };

let z: RootNode = {
  x: {
    x: t1,
    y: {
      x: {},
      z1: {
        x: t2,
        y: 1
      }
    }
  },
  z2: 0
};

function main(): void {}
