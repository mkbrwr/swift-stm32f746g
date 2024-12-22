# BUILD
make

# RUN
stm32-programmer-cli -c port=SWD -d .build/release/Application.bin 0x08000000 -v -rst
