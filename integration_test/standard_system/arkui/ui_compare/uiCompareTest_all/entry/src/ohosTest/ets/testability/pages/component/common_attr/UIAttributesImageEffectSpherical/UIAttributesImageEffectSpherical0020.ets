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

@Entry
@Component
struct UIAttributesImageEffectSpherical0020 {
  @State name: string = 'UIAttributesImageEffectSpherical0020';
  @State message: string = this.name;
  @State sphericalEffectValue: number | undefined = 0;
  @State sphericalEffectInfo: string = 'Current sphericalEffectValue: ' + this.sphericalEffectValue?.toString();
  private originValue = this.sphericalEffectValue;
  private switchedFlag: boolean = false;
  private switchValue: number = 1;

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Text(this.sphericalEffectInfo)
        .fontSize(15)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('Switch sphericalEffectValue')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          if (this.switchedFlag) {
            this.switchedFlag = !this.switchedFlag;
            this.sphericalEffectValue = this.originValue;
            this.sphericalEffectInfo = 'Current sphericalEffectValue: ' + this.sphericalEffectValue?.toString();
          } else {
            this.switchedFlag = !this.switchedFlag;
            this.originValue = this.sphericalEffectValue;
            this.sphericalEffectValue = this.switchValue;
            this.sphericalEffectInfo = 'Current sphericalEffectValue: ' + this.sphericalEffectValue?.toString();
          }
        })

      TextInput({
        placeholder: '请输入变化范围百分比（[0%,100%]）'
      })
        .width('50%')
        .height(35)
        .type(InputType.Number)
        .enterKeyType(EnterKeyType.Done)
        .caretColor(Color.Red)
        .placeholderColor(Color.Blue)
        .placeholderFont({
          size: 20,
          style: FontStyle.Italic,
          weight: FontWeight.Bold
        })
        .sphericalEffect(this.sphericalEffectValue)
        .margin(20)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

}