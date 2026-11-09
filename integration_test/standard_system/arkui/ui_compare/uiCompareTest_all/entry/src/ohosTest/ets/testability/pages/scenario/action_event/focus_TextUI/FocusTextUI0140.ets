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
@Entry
@Component
struct FocusTextUI0140 {
  build() {
    Column() {
      // 测试组合1: number 5和20
      Text('1. number 5和20')
        .minFontSize(5)
        .maxFontSize(20)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合2: string "5"和"20"
      Text('2. string 5和20')
        .minFontSize('5')
        .maxFontSize('20')
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合3: Resource string 5和20
      Text('3. Resource string 5和20')
        .minFontSize($r('app.string.string_value_5'))
        .maxFontSize($r('app.string.string_value_20'))
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合4: Resource float 5和20
      Text('4. Resource float 5和20')
        .minFontSize($r('app.float.float_value_5') )
        .maxFontSize($r('app.float.float_value_20') )
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合5: Resource integer 5和20
      Text('5. Resource integer 5和20')
        .minFontSize($r('app.integer.integer_value_5') )
        .maxFontSize($r('app.integer.integer_value_20') )
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合6: number 2和string "20"
      Text('6. number 2和string 20')
        .minFontSize(2)
        .maxFontSize('20')
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合7: string "5"和Resource float 20
      Text('7. string 5和Resource float 20')
        .minFontSize('5')
        .maxFontSize($r('app.float.float_value_20') )
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合8: Resource string 5和integer 20
      Text('8. Resource string 5和integer 20')
        .minFontSize($r('app.string.string_value_5'))
        .maxFontSize(20)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合9: Resource float 5和number 20
      Text('9. Resource float 5和number 20')
        .minFontSize($r('app.float.float_value_5') )
        .maxFontSize(20)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合10: Resource integer 5和string "20"
      Text('10. Resource integer 5和string 20')
        .minFontSize($r('app.integer.integer_value_5') )
        .maxFontSize('20')
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合11: number 20和5
      Text('11. number 20和5')
        .minFontSize(20)
        .maxFontSize(5)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合12: Resource integer 20和string 5
      Text('12. Resource integer 20和string 5')
        .minFontSize($r('app.integer.integer_value_20') )
        .maxFontSize('5')
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合13: number 20和5，fontSize(12)
      Text('13. number 20和5，fontSize(12)')
        .fontSize(12)
        .minFontSize(20)
        .maxFontSize(5)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合14: string "20"和"5"
      Text('14. string 20和5')
        .minFontSize('20')
        .maxFontSize('5')
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合15: string "5"和Resource integer 20
      Text('15. string 5和Resource integer 20')
        .minFontSize('5')
        .maxFontSize($r('app.integer.integer_value_20') )
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 测试组合16: string "5"和number 20
      Text('16. string 5和number 20')
        .minFontSize('5')
        .maxFontSize(20)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .padding(10)
  }
}