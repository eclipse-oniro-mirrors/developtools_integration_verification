/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { CommonModifier } from '@kit.ArkUI'

const TEST_TAG: string = 'AttributeModifier';

class MyModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  public setGroup1(): void {
    this.borderStyle(BorderStyle.Dotted)
    this.borderWidth(8)
  }

  public setGroup2(): void {
    this.borderStyle(BorderStyle.Dashed)
    this.borderWidth(8)
  }
}

@Component
struct MyImage {
  @Link modifier: CommonModifier

  build() {
    Image('/icon.png').attributeModifier(this.modifier as MyModifier)
  }
}

@Entry
@Component
struct UIComponentMediaSvgLinkImageColorFilter001 {
  @State message: string = 'Hello'
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State myModifier: CommonModifier = new MyModifier().width(100).height(100).margin(10)
  index: number = 0;

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .key('UIComponentMediaSvgLinkImageColorFilter001_001')

      MyImage({ modifier: this.myModifier })

      Button('切换属性值')
        .stateEffect(true)
        .id('change')
        .onClick(() => {
          console.log(TEST_TAG, 'onClick')
          this.index++;
          if (this.index % 2 === 1) {
            (this.myModifier as MyModifier).setGroup1()
            console.log(TEST_TAG, 'setGroup1')
          } else {
            (this.myModifier as MyModifier).setGroup2()
            console.log(TEST_TAG, 'setGroup2')
          }
        })
    }
  }
}