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
import { BusinessError } from '@kit.BasicServicesKit';

class MyData2 {
  public str: string;
  constructor(str: string) {
    this.str = str;
  }
}

@Entry
@Component
struct StatusManagerV2IfElseAnimateTo005 {
  @State data1: MyData2|undefined = new MyData2('branch 0');
  @State data2: MyData2|undefined = new MyData2('branch 1');
  @State data3: MyData2|undefined = new MyData2('branch 2');
  @State data4: MyData2|undefined = new MyData2('branch 3');
  @State dataFlag: number = 0;
  private caseName: string = 'SUB_ACE_STATUSMANAGERV2_IFELSE_ANIMATETO_0050';

  async routePage() {
    this.getUIContext().getRouter().pushUrl({
      url: 'testability/pages/scenario/animation/StatusManagerV2IfElseAnimateTo/StatusManagerV2IfElseAnimateTo006',
    })
      .then(() => {
        console.info(`${this.caseName} StatusManagerV2IfElseAnimateTo006 succeeded`);
      })
      .catch((error: BusinessError) => {
        console.error(`${this.caseName} StatusManagerV2IfElseAnimateTo006 pushUrl failed, error is ${JSON.stringify(error)}.`);
      })
  }

  build() {
    Column() {
      Column() {
        Text('状态管理V1')
          .fontSize(30)
          .textAlign(TextAlign.Center)
          .id('pushUrl')
          .onClick(() => {
            this.routePage();
          })
      }.width('100%').height('10%').justifyContent(FlexAlign.Center)
      Column() {
        if (this.data1) {
          Text(this.data1?.str)
            .fontColor(Color.Blue)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .id('1')
            .transition(TransitionEffect.IDENTITY)
        } else if (this.data2) {
          Text(this.data2?.str)
            .fontColor(Color.Pink)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .id('2')
            .transition(TransitionEffect.IDENTITY)
        } else if (this.data3) {
          Text(this.data3?.str)
            .fontColor(Color.Red)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .id('3')
            .transition(TransitionEffect.IDENTITY)
        } else if (this.data4) {
          Text(this.data4?.str)
            .fontColor(Color.Orange)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .id('4')
            .transition(TransitionEffect.IDENTITY)
        } else {
          Text('其他')
            .fontColor(Color.Black)
            .fontSize(40)
            .textAlign(TextAlign.Center)
            .id('5')
            .transition(TransitionEffect.IDENTITY)
        }
      }.width('100%').height('20%').justifyContent(FlexAlign.Center)
      Column() {
        Button('play with animation')
          .id('changeData1')
          .margin(20)
          .fontSize(30)
          .stateEffect(true)
          .type(ButtonType.Capsule)
          .buttonStyle(ButtonStyleMode.NORMAL)
          .onClick(() => {
            animateTo({}, () => {
              this.dataFlag++;
              console.info(`${this.caseName} dataFlag is ${this.dataFlag}`);
              if (this.dataFlag == 0) {
                this.data1 = new MyData2('branch 0');
                this.data2 = undefined;
                this.data3 = undefined;
                this.data4 = undefined;
              } else if(this.dataFlag == 1) {
                this.data1 = undefined;
                this.data2 = new MyData2('branch 1');
                this.data3 = undefined;
                this.data4 = undefined;
              } else if (this.dataFlag == 2) {
                this.data1 = undefined;
                this.data2 = undefined;
                this.data3 = new MyData2('branch 2');
                this.data4 = undefined;
              } else if (this.dataFlag == 3) {
                this.data1 = undefined;
                this.data2 = undefined;
                this.data3 = undefined;
                this.data4 = new MyData2('branch 3');
              } else {
                this.data1 = undefined;
                this.data2 = undefined;
                this.data3 = undefined;
                this.data4 = undefined;
              }
              console.info(`${this.caseName} data1 is ${JSON.stringify(this.data1)}`);
              console.info(`${this.caseName} data2 is ${JSON.stringify(this.data2)}`);
              console.info(`${this.caseName} data3 is ${JSON.stringify(this.data3)}`);
              console.info(`${this.caseName} data4 is ${JSON.stringify(this.data4)}`);
            })
          })
      }.width('100%').height('10%').justifyContent(FlexAlign.Center)
    }.justifyContent(FlexAlign.Center)
  }
}