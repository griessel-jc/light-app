CREATE or REPLACE FUNCTION public.led_info_notify_trigger() RETURNS trigger as $$
DECLARE
	BEGIN
		PERFORM pg_notify( CAST('led_info_updated' AS text), row_to_json(NEW)::text);
		RETURN new;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER led_info_update_trigger AFTER INSERT ON public.led_info
FOR EACH ROW EXECUTE PROCEDURE public.led_info_notify_trigger();