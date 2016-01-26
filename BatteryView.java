import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.view.View;

/**
 * This is an Android Custom View.
 */
public class BatteryView extends View {
    /**
     * Indicate the status of charging.
     * Yes, if it's charging.
     * No, otherwise.
     */
    private boolean mCharging;
    
    /**
     * Indicate the level of the battery, ranging from 0 to 100.
     */
    private int mLevel;
    
    /**
     * Paint the Main Battery Body with transparent color.
     */
    private Paint mMainRectPaint;
    
    /**
     * Paint the Main Battery Body with white border.
     */
    private Paint mMainRectStrokePaint;
    
    /**
     * Paint the Main Battery Body Battery Level with custom color.
     */
    private Paint mMainRectFillPaint;
    
    /**
     * Paint the Battery Head with white color filled.
     */
    private Paint mSmallRectPaint;
    
    /**
     * Paint the Charging Sign in the Battery Main Body.
     */
    private Paint mChargingPaint;

    /**
     * Battery Level Custom Color.
     */
    private int fillColor;

    public BatteryView(Context context) {
        super(context);
        init(null, 0);
    }

    public BatteryView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(attrs, 0);
    }

    public BatteryView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(attrs, defStyle);
    }

    /**
     * Initialize each property to its default value.
     */
    private void init(AttributeSet attrs, int defStyle) {
        // Load attributes
        final TypedArray a = getContext().obtainStyledAttributes(
                attrs, R.styleable.BatteryView, defStyle, 0);

        mCharging = a.getBoolean(R.styleable.BatteryView_charging, false);
        mLevel = a.getInteger(R.styleable.BatteryView_level, 100);
        a.recycle();

        setBackgroundColor(Color.TRANSPARENT);
        fillColor = Color.GREEN;

        mMainRectPaint = new Paint();
        mMainRectPaint.setStyle(Paint.Style.FILL);
        mMainRectPaint.setColor(Color.TRANSPARENT);

        mMainRectStrokePaint = new Paint();
        mMainRectStrokePaint.setStyle(Paint.Style.STROKE);
        mMainRectStrokePaint.setStrokeWidth(5.f);
        mMainRectStrokePaint.setColor(Color.WHITE);

        mMainRectFillPaint = new Paint();
        mMainRectFillPaint.setStyle(Paint.Style.FILL);
        mMainRectFillPaint.setColor(fillColor);

        mSmallRectPaint = new Paint();
        mSmallRectPaint.setStyle(Paint.Style.FILL);
        mSmallRectPaint.setColor(Color.WHITE);

        mChargingPaint = new Paint();
        mChargingPaint.setStyle(Paint.Style.FILL_AND_STROKE);
        mChargingPaint.setColor(Color.WHITE);
        mChargingPaint.setStrokeWidth(5.f);
    }

    /**
     * Draw the Battery View.
     */
    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        // allocations per draw cycle.
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();

        int contentWidth = getWidth() - paddingLeft - paddingRight;
        int contentHeight = getHeight() - paddingTop - paddingBottom;

        int smallRectWidth = (int) (1.f / 10.f * contentWidth);
        int smallRectHeight = 2 * smallRectWidth;
        int offset = 10;
        Rect mainRect = new Rect(paddingLeft, paddingTop, paddingLeft + contentWidth - smallRectWidth, paddingTop + contentHeight);
        Rect fillRect = new Rect(mainRect.left + offset, mainRect.top + offset, mainRect.right * this.getmLevel() / 100, mainRect.bottom - offset);
        Rect smallRect = new Rect(paddingLeft + contentWidth - smallRectWidth, paddingTop + (int) (contentHeight - smallRectHeight) / 2, paddingLeft + contentWidth, paddingTop + (int) (contentHeight + smallRectHeight) / 2);
        canvas.drawRect(mainRect, mMainRectStrokePaint);
        canvas.drawRect(mainRect, mMainRectPaint);
        canvas.drawRect(smallRect, mSmallRectPaint);
        canvas.drawRect(fillRect, mMainRectFillPaint);

        if (ismCharging()) {
            int chargingHeight = fillRect.height();
            Point p0 = new Point(mainRect.centerX() + chargingHeight / 4, mainRect.centerY() - chargingHeight / 2);
            Point p1 = new Point(mainRect.centerX() - chargingHeight / 4, mainRect.centerY());
            Point p2 = new Point(mainRect.centerX() + chargingHeight / 4, mainRect.centerY());
            Point p3 = new Point(mainRect.centerX() - chargingHeight / 4, mainRect.centerY() + chargingHeight / 2);
            Path path = new Path();
            path.moveTo(p0.x, p0.y);
            path.lineTo(p1.x, p1.y);
            path.lineTo(p2.x, p2.y);
            path.lineTo(p3.x, p3.y);
            path.close();
            canvas.drawPath(path, mChargingPaint);
        }
    }

    /**
     * Getter of mCharging
     */
    public boolean ismCharging() {
        return mCharging;
    }

    /**
     * Setter of mCharging
     */
    public void setmCharging(boolean mCharging) {
        this.mCharging = mCharging;
        invalidate();
    }
    
    /**
     * Getter of mLevel
     */
    public int getmLevel() {
        return mLevel;
    }
    
    /**
     * Setter of mLevel
     */
    public void setmLevel(int mLevel) {
        if (mLevel > 100) mLevel = 100;
        if (mLevel < 0) mLevel = 0;
        this.mLevel = mLevel;
        invalidate();
    }
}
