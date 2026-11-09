/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@ObservedV2
class Pencil {
  @Trace length: number = 21; // 当length变化时，会刷新关联的组件
}
class Bag {
  public width: number = 50;
  public height: number = 60;
  pencil: Pencil = new Pencil();
}

@Entry
@ComponentV2
struct Page {
  bag: Bag = new Bag();

  build() {
    Column() {
      Text('pencil length'+ this.bag.pencil.length)
      // UINode (1)
      Button('change length')
        .onClick(() => {
          // 点击更改length值，UINode（1）会刷新
          this.bag.pencil.length += 100;
        })
      Button('assign Son')
        .onClick(() => {
          // 由于变量bag非状态变量，因此无法刷新UINode（1）
          this.bag = new Bag();
        })
    }
  }
}