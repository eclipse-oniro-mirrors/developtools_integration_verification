/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 自定义手势修饰器（添加双击手势）
class DoubleTapModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    event.clearGestures()
    console.info('清除该组件上通过modifier绑定的手势')
  }
}

@Entry
@Component
struct GestureClearList {
  private data: string[] = this.generateListData(30)
  private gestureModifier1: GestureModifier = new DoubleTapModifier()
  @State useCustomGesture: boolean = true

  private generateListData(count: number): string[] {
    const result: string[] = []
    for (let i = 0; i < count; i++) {
      result.push(`Item ${i + 1}`)
    }
    return result
  }

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.data, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(20)
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
              .borderRadius(8)
              .padding(10)
          }
        }, (item: string) => item)
      }
      .id('list')
      .width('90%')
      .height('80%')
      .layoutWeight(1)
      .gestureModifier(this.gestureModifier1)
      .border({ width: 1, color: Color.Gray })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F0F0F0')
  }
}