<?php

use PHPUnit\Framework\TestCase;

class ReturnLunghezzaReelTest extends TestCase
{
    /**
     * @dataProvider provider
     */
    public function testReturnLunghezzaReel(string $motoreLed, float $expected): void
    {
        $result = return_lunghezza_reel(100, $motoreLed);
        $this->assertEqualsWithDelta($expected, $result, 0.01);
    }

    public static function provider(): array
    {
        return [
            ['G', 83.4],
            ['N', 83.3],
            ['C', 83.4],
            ['M', 55.6],
            ['E', 96.0],
            ['I', 77.0],
            ['D', 100.0],
            ['F', 100.0],
        ];
    }
}
