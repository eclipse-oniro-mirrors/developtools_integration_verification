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
struct ActionEventCommonEventFrameNodeGesture013 {
  private buttArr: string[] = ['A', 'B', 'C', 'D'];
  @State value: string = '';
  @State text: string = '';
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right })

  build() {
    Column() {
      Row() {
        Column() {
          Text(this.text)
            .fontColor(Color.Red)
            .fontSize(30)
          Text(this.value)
            .fontColor(Color.Black)
            .fontSize(30)
        }
      }
      Row() {
        Button('id: ' + this.buttArr[0])
          .id('buttonA')
          .nextFocus({forward: 'buttonC', backward: 'cb3', up: 'togcb1', down: 'togswitch1', left: 'cb1', right: 'togbutton1'})
        Button('id: ' + this.buttArr[1])
          .id('buttonB')
          .nextFocus({forward: 'togcb1', backward: 'cb3', up: 'togcb2', down: 'togswitch1', left: 'cd2', right: 'togbutton2'})
      }
      Button('id: ' + this.buttArr[2])
        .id('buttonC')
        .nextFocus({forward: 'cb2', backward: 'togcb2', up: 'buttonA', down: 'togbutton2', left: 'cb3', right: 'togswich2'})
      Button('id: ' + this.buttArr[3])
        .id('buttonD')
        .nextFocus({forward: 'togcb2', backward: 'cb2', up: 'togswitch1', down: 'togswitch1', left: 'cb1', right: 'togbutton1'})

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'checkbox1' })
          .id('cb1')
          .nextFocus({forward: 'togcb2', backward: 'togbutton1', up: 'cb2', down: 'togcb2', left: 'togcb1', right: 'togswitch1'})
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is' + value);
          })
          .width(30)
          .height(30)
        Text('Checkbox1').fontSize(20)
      }

      Flex({ justifyContent: FlexAlign.Center }) {
        Checkbox({ name: 'checkbox2' })
          .id('cb2')
          .nextFocus({forward: 'togbutton1', backward: 'cb3', up: 'buttonB', down: 'togswitch1', left: 'cb2', right: 'togbutton2'})
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox2 change is' + value);
          })
          .width(30)
          .height(30)
        Text('Checkbox2').fontSize(20)
      }

      Flex({ justifyContent: FlexAlign.Center }) {
        Checkbox({ name: 'checkbox3' })
          .id('cb3')
          .nextFocus({forward: 'buttonD', backward: 'cb1', up: 'togswitch2', down: 'togcb1', left: 'togcb1', right: 'togcb2'})
          .selectedColor(0x39a2db)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange((value: boolean) => {
            console.info('Checkbox3 change is' + value);
          })
          .width(30)
          .height(30)
        Text('Checkbox3').fontSize(20)
      }

      Text('type: Switch').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .id('togswitch1')
          .nextFocus({forward: 'togswitch1', backward: 'togcb1', up: 'buttonB', down: 'cb2', left: '', right: 'togswitch2'})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })

        Toggle({ type: ToggleType.Switch, isOn: true })
          .id('togswitch2')
          .nextFocus({forward: 'cb3', backward: 'buttonC', up: 'cb2', down: 'togbutton2', left: 'togswitch1', right: 'togcb2'})
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Checkbox').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Checkbox, isOn: false })
          .id('togcb1')
          .nextFocus({forward: 'togcb1', backward: 'cb1', up: 'togswitch1', down: 'togbutton2', left: 'cb2', right: 'cb3'})
          .size({ width: 20, height: 20 })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })

        Toggle({ type: ToggleType.Checkbox, isOn: true })
          .id('togcb2')
          .nextFocus({forward: 'togswitch1', backward: 'buttonA', up: 'cb3', down: 'togswitch1', left: 'cb1', right: 'togbutton2'})
          .size({ width: 20, height: 20 })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
      }

      Text('type: Button').fontSize(12).fontColor(0xcccccc).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Toggle({ type: ToggleType.Button, isOn: false }) {
          Text('status button').fontColor('#182431').fontSize(12)
        }
        .id('togbutton1')
        .nextFocus({forward: 'buttonC', backward: 'cb2', up: 'togcb1', down: 'togbutton2', left: 'cb1', right: 'togbutton1'})
        .width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })

        Toggle({ type: ToggleType.Button, isOn: true }) {
          Text('status button').fontColor('#182431').fontSize(12)
        }
        .id('togbutton2')
        .nextFocus({forward: 'togswitch1', backward: 'togcb2', up: 'buttonD', down: 'cb3', left: 'togcb1', right: 'buttonA'})
        .width(106)
        .selectedColor('rgba(0,125,255,0.20)')
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn)
        })
      }
    }
    .id('screen')
    .gesture(
      PanGesture(this.panOption)
        .onActionStart((event: GestureEvent) => {
          this.text = 'aaa';
          this.value = JSON.stringify(event.fingerList[0]);
        })
    )
  }
}