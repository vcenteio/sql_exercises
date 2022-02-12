-- https://www.codewars.com/kata/5eaecb855179590011d2c020/train/sql

CREATE FUNCTION log_document_insert()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO documents_changelog (document_id, new_data) VALUES (NEW.id, NEW.data);
            RETURN NEW;
        END;
    $$;

CREATE TRIGGER document_insert_trigger
    BEFORE INSERT
    ON documents
    FOR EACH ROW
    EXECUTE PROCEDURE log_document_insert();

CREATE FUNCTION log_document_update()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO documents_changelog (document_id, old_data, new_data) VALUES (NEW.id, OLD.data, NEW.data);
            RETURN NEW;
        END;
    $$;

CREATE TRIGGER document_update_trigger
    BEFORE UPDATE
    ON documents
    FOR EACH ROW
    EXECUTE PROCEDURE log_document_update();

CREATE FUNCTION log_document_delete()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO documents_changelog (document_id, old_data) VALUES (OLD.id, OLD.data);
            RETURN OLD;
        END;
    $$;

CREATE TRIGGER document_delete_trigger
    BEFORE DELETE
    ON documents
    FOR EACH ROW
    EXECUTE PROCEDURE log_document_delete();
