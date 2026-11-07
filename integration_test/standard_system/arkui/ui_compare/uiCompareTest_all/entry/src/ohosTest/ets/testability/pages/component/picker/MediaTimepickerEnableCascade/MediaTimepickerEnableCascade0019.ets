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

interface TestStep0019 {
  hour: number;
  desc: string;
}

@Entry
@Component
struct MediaTimepickerEnableCascade0019 {
  @State selectedTime: Date = new Date('2022-07-22T13:00:00');
  private previousHour: number = 13; // 记录上一次的小时值

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime,
      })
        .enableCascade(true)
        .loop(true)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            // 检测11点和12点之间的切换
            this.handleAmPmSwitch(this.previousHour, value.hour);

            // 创建新的Date对象来触发状态更新
            const newTime = new Date(this.selectedTime);
            newTime.setHours(value.hour, value.minute);
            this.selectedTime = newTime;

            // 更新上一次的小时值
            this.previousHour = value.hour;

            console.info('select current date is: ' + JSON.stringify(value));
          }
        })
    }.width('100%')
    .onAppear(() => {
      // 页面出现后，延迟执行自动正向滚动操作
      setTimeout(() => {
        this.performAutoScroll();
      }, 1000);
    })
  }

  /**
   * 执行AM/PM切换测试的反向滚动
   */
  private performAutoScroll() {
    console.info('开始执行AM/PM切换测试的反向滚动');

    // 测试序列：13点 → 12点 → 11点 → 10点 → 9点（从下午1点滚动到上午9点）
    const testSequence: TestStep0019[] = [
      { hour: 13, desc: '13点(1PM)' },
      { hour: 12, desc: '12点PM' },
      { hour: 11, desc: '11点AM' },
      { hour: 10, desc: '10点AM' },
      { hour: 9, desc: '9点AM' }
    ];

    const stepDelay = 800; // 每步间隔800ms，让AM/PM切换更清晰

    console.info('开始AM/PM切换反向滚动测试');
    this.executeAmPmScrollTest(testSequence, 0, stepDelay);
  }

  /**
   * 执行AM/PM切换反向滚动测试
   * @param testSequence 测试序列
   * @param currentIndex 当前索引
   * @param stepDelay 步骤延迟
   */
  private executeAmPmScrollTest(testSequence: TestStep0019[], currentIndex: number, stepDelay: number) {
    if (currentIndex < testSequence.length) {
      const currentTest = testSequence[currentIndex];

      // 创建新的Date对象来触发状态更新
      const newTime = new Date(this.selectedTime);
      newTime.setHours(currentTest.hour, this.selectedTime.getMinutes());
      this.selectedTime = newTime;

      console.info(`AM/PM反向滚动步骤 ${currentIndex + 1}/${testSequence.length}: 设置为${currentTest.desc}`);

      // 继续下一步测试
      if (currentIndex < testSequence.length - 1) {
        setTimeout(() => {
          this.executeAmPmScrollTest(testSequence, currentIndex + 1, stepDelay);
        }, stepDelay);
      } else {
        console.info('AM/PM切换反向滚动测试完成');
      }
    }
  }

  /**
   * 处理AM/PM切换逻辑
   * @param previousHour 上一次的小时值
   * @param currentHour 当前的小时值
   */
  private handleAmPmSwitch(previousHour: number, currentHour: number) {
    // 检测从12点切换到11点的情况（反向滚动）
    if (previousHour === 12 && currentHour === 11) {
      const currentTime = new Date();
      const currentActualHour = currentTime.getHours();

      if (currentActualHour >= 12) {
        // 当前实际时间是下午，从12点PM切换到11点应该是上午
        console.info('从12点PM切换到11点，应该切换为上午(AM)');
        console.info(`当前实际时间：${currentActualHour}点，属于下午，所以11点应为上午`);
      } else {
        // 当前实际时间是上午，保持上午
        console.info('从12点切换到11点，当前已是上午时段');
        console.info(`当前实际时间：${currentActualHour}点，属于上午，所以11点仍为上午`);
      }
    }

    // 记录所有小时切换
    if (previousHour !== currentHour) {
      const previousAmPm = this.getAmPmString(previousHour);
      const currentAmPm = this.getAmPmString(currentHour);
      console.info(`时间切换：${previousHour}点${previousAmPm} → ${currentHour}点${currentAmPm}`);
    }
  }

  /**
   * 根据小时值返回AM/PM字符串
   * @param hour 小时值
   * @returns AM/PM字符串
   */
  private getAmPmString(hour: number): string {
    return hour < 12 ? 'AM' : 'PM';
  }
}
