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
class MyData1 {
  public str: string;
  constructor(str: string) {
    this.str = str;
  }
}

@Entry
@Component
struct StatusManagerV2IfElseAnimateTo001 {
  @State data1: MyData1|undefined = new MyData1('branch 0');
  @State data2: MyData1|undefined = new MyData1('branch 1');
  private caseName: string = 'SUB_ACE_STATUSMANAGERV2_IFELSE_ANIMATETO_0010';

  build() {
    Column() {
      Column() {
        Text('非动画打断')
          .fontSize(30)
          .textAlign(TextAlign.Center)
      }.width('100%').height('10%').justifyContent(FlexAlign.Center)
      Column() {
        if (this.data1) {
          Text(this.data1?.str)
            .fontColor(Color.Blue)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .transition(TransitionEffect.IDENTITY)
            .id('1')
        } else {
          Text(this.data2?.str)
            .fontColor(Color.Pink)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .transition(TransitionEffect.IDENTITY)
            .id('2')
        }
      }.width('100%').height('20%').justifyContent(FlexAlign.Center)
      Column() {
        Button('play with animation')
          .id('changeData')
          .margin(20)
          .fontSize(30)
          .stateEffect(true)
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .onClick(() => {
            if (this.data1) {
              this.data1 = undefined;
              this.data2 = new MyData1('branch 1');
              console.info(`${this.caseName} data1 is ${JSON.stringify(this.data1)}`);
              console.info(`${this.caseName} data2 is ${JSON.stringify(this.data2)}`);
            } else {
              this.data1 = new MyData1('branch 0');
              this.data2 = undefined;
              console.info(`${this.caseName} data1 is ${JSON.stringify(this.data1)}`);
              console.info(`${this.caseName} data2 is ${JSON.stringify(this.data2)}`);
            }
          })
      }.width('100%').height('10%').justifyContent(FlexAlign.Center)
    }.justifyContent(FlexAlign.Center)
  }
}